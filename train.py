from imageai.Classification.Custom import ClassificationModelTrainer

model_trainer = ClassificationModelTrainer()
model_trainer.setModelTypeAsInceptionV3()
model_trainer.setDataDirectory("data")
model_trainer.trainModel(num_objects=2, continue_from_model="data/models/model_ex-283_acc-0.999897.h5", transfer_with_full_training=True, training_image_size=250, num_experiments=300, enhance_data=False, batch_size=32, show_network_summary=True)

