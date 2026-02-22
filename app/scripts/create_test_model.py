#!/usr/bin/env python3
"""
Create a simple TFLite model for testing infrastructure.

This script creates a minimal TFLite model that:
- Takes audio input: Float32 [1, 16000] (1 second @ 16kHz)
- Outputs classification: Float32 [1, 2] (safe/fraud probabilities)
- Uses simple 1D convolution + dense layer
- Model size: <100KB

Usage:
    python3 create_test_model.py
    
Output:
    assets/models/test_model.tflite
"""

import tensorflow as tf
import numpy as np
import os

def create_test_model():
    """Create a simple 1D CNN model for audio classification."""
    print("🔨 Creating test TFLite model...")
    
    # Create simple model
    model = tf.keras.Sequential([
        tf.keras.layers.Input(shape=(16000,), name='audio_input'),
        tf.keras.layers.Reshape((16000, 1)),
        tf.keras.layers.Conv1D(8, 3, activation='relu', name='conv1d'),
        tf.keras.layers.GlobalAveragePooling1D(name='pooling'),
        tf.keras.layers.Dense(2, activation='softmax', name='output')
    ], name='test_audio_classifier')
    
    # Compile model (required for conversion)
    model.compile(
        optimizer='adam',
        loss='sparse_categorical_crossentropy',
        metrics=['accuracy']
    )
    
    # Print model summary
    print("\n📊 Model Summary:")
    model.summary()
    
    # Convert to TFLite
    print("\n🔄 Converting to TFLite...")
    converter = tf.lite.TFLiteConverter.from_keras_model(model)
    
    # Apply optimizations (quantization)
    converter.optimizations = [tf.lite.Optimize.DEFAULT]
    
    # Convert
    tflite_model = converter.convert()
    
    # Get model size
    model_size_kb = len(tflite_model) / 1024
    print(f"✅ Model size: {model_size_kb:.2f} KB")
    
    # Save model
    output_path = 'assets/models/test_model.tflite'
    os.makedirs('assets/models', exist_ok=True)
    
    with open(output_path, 'wb') as f:
        f.write(tflite_model)
    
    print(f"✅ Model saved to: {output_path}")
    
    # Test model with dummy data
    print("\n🧪 Testing model with dummy data...")
    interpreter = tf.lite.Interpreter(model_content=tflite_model)
    interpreter.allocate_tensors()
    
    # Get input and output details
    input_details = interpreter.get_input_details()
    output_details = interpreter.get_output_details()
    
    print(f"   Input shape: {input_details[0]['shape']}")
    print(f"   Input dtype: {input_details[0]['dtype']}")
    print(f"   Output shape: {output_details[0]['shape']}")
    print(f"   Output dtype: {output_details[0]['dtype']}")
    
    # Run inference with dummy data
    dummy_audio = np.zeros((1, 16000), dtype=np.float32)
    interpreter.set_tensor(input_details[0]['index'], dummy_audio)
    interpreter.invoke()
    output = interpreter.get_tensor(output_details[0]['index'])
    
    print(f"   Output: {output[0]}")
    print("✅ Model test successful!")
    
    return output_path

if __name__ == '__main__':
    print("=" * 60)
    print("TFLite Test Model Creator")
    print("=" * 60)
    
    try:
        model_path = create_test_model()
        print("\n" + "=" * 60)
        print("✅ SUCCESS!")
        print(f"Model created at: {model_path}")
        print("=" * 60)
    except Exception as e:
        print(f"\n❌ ERROR: {e}")
        import traceback
        traceback.print_exc()
