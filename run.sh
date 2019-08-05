python build_data.py    --X_input_dir D:/GitHub/Mod_Cycle_GAN_Data/data/pig/trainA \
                        --Y_input_dir D:/GitHub/Mod_Cycle_GAN_Data/data/pig/trainB \
                        --X_output_file D:/GitHub/Mod_Cycle_GAN_Data/data/pig/tfrecords/X.tfrecords \
                        --Y_output_file D:/GitHub/Mod_Cycle_GAN_Data/data/pig/tfrecords/Y.tfrecords

python train.py --X D:/GitHub/Mod_Cycle_GAN_Data/data/pig/tfrecords/X.tfrecords \
	            --Y D:/GitHub/Mod_Cycle_GAN_Data/data/pig/tfrecords/Y.tfrecords \
                --frozen_step 500 \
                --save_freq 1000 \
                --max_ckpt 40 \
                --ckpt_dir D:/GitHub/Mod_Cycle_GAN_Data/checkpoints \
                # --load_model D:/GitHub/Mod_Cycle_GAN_Data/checkpoints/20190805-0233

python export_graph.py  --checkpoint_dir D:/GitHub/Mod_Cycle_GAN_Data/checkpoints/20190805-1046 \
                        --output_dir D:/GitHub/Mod_Cycle_GAN_Data/pretrained \
                        --XtoY_model X2Y.pb \
                        --YtoX_model Y2X.pb \
                        --image_size 256

python inference.py --model D:/GitHub/Mod_Cycle_GAN_Data/pretrained/X2Y.pb \
                    --input D:/GitHub/Mod_Cycle_GAN_Data/data/pig/testA \
                    --output D:/GitHub/Mod_Cycle_GAN_Data/data/pig/outputA \
                    --image_size 256 \
	                --direction XtoY


A&X: grayscale
B&Y: RGB