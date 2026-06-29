	.include "asm/macros/music_voice.inc"

	.section .rodata.voicegroup035, "a", %progbits

	.align 2
	@********************** Voicegroup **********************@

	.global voicegroup035
voicegroup035:	@ 0x08202AE4
	voice_directsound 60, 0, DirectSoundData_horse1_f1_flat1_13k8b, 255, 0, 255, 0	@08202AE4
	voice_directsound 60, 0, DirectSoundData_horse1_b1_flat1_13k8b, 255, 0, 255, 0	@08202AF0
	voice_directsound 60, 0, DirectSoundData_horse1_t2_flat1_13k8b, 255, 0, 255, 0	@08202AFC
	voice_directsound 60, 0, DirectSoundData_horse2_f1_flat1_13k8b, 255, 0, 255, 0	@08202B08
	voice_directsound 60, 0, DirectSoundData_horse2_b2_flat1_13k8b, 255, 0, 255, 0	@08202B14
	voice_directsound 60, 0, DirectSoundData_horse2_t1_flat1_13k8b, 255, 0, 255, 0	@08202B20
	voice_directsound 60, 0, DirectSoundData_horse3_f1_flat1_13k8b, 255, 0, 255, 0	@08202B2C
	voice_directsound 60, 0, DirectSoundData_horse3_b1_flat1_13k8b, 255, 0, 255, 0	@08202B38
	voice_directsound 60, 0, DirectSoundData_horse3_t3_flat1_13k8b, 255, 0, 255, 0	@08202B44
	voice_square_1 0, 2, 0, 0, 15, 0	@08202B50
	voice_directsound 60, 0, DirectSoundData_horse1_f1_water1_m1_13k8b, 255, 0, 255, 0	@08202B5C
	voice_directsound 60, 0, DirectSoundData_horse1_b1_water1_m1_13k8b, 255, 0, 255, 0	@08202B68
	voice_directsound 60, 0, DirectSoundData_horse1_t2_water1_m1_13k8b, 255, 0, 255, 0	@08202B74
	voice_directsound 60, 0, DirectSoundData_horse2_f1_water1_m1_13k8b, 255, 0, 255, 0	@08202B80
	voice_directsound 60, 0, DirectSoundData_horse2_b2_water1_m1_13k8b, 255, 0, 255, 0	@08202B8C
	voice_directsound 60, 0, DirectSoundData_horse2_t1_water1_m1_13k8b, 255, 0, 255, 0	@08202B98
	voice_directsound 60, 0, DirectSoundData_horse3_f1_water1_m1_13k8b, 255, 0, 255, 0	@08202BA4
	voice_directsound 60, 0, DirectSoundData_horse3_b1_water1_m1_13k8b, 255, 0, 255, 0	@08202BB0
	voice_directsound 60, 0, DirectSoundData_horse3_t3_water1_m1_13k8b, 255, 0, 255, 0	@08202BBC
	voice_square_1 0, 2, 0, 0, 15, 0	@08202BC8
	voice_directsound 60, 0, DirectSoundData_horse1_f1_grass1_m1_13k8b, 255, 0, 255, 0	@08202BD4
	voice_directsound 60, 0, DirectSoundData_horse1_b1_grass1_m1_13k8b, 255, 0, 255, 0	@08202BE0
	voice_directsound 60, 0, DirectSoundData_horse1_t2_grass1_m1_13k8b, 255, 0, 255, 0	@08202BEC
	voice_directsound 60, 0, DirectSoundData_horse2_f1_grass1_m1_13k8b, 255, 0, 255, 0	@08202BF8

	@ Trailing non-voice filler region (uniform-byte padding past the
	@ last real voice entry; carved-region boundary, not a voice table).
	.byte 0x00, 0x3C, 0x00	@08202C04
