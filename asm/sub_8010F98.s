	.syntax unified
	.set ClearTalkFaceRefs, 0x080066EC + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set ResetFaces, 0x08005430 + 1
	.set sub_80080A4, 0x080080A4 + 1
	.section .text.sub_8010F98, "ax", %progbits
@ sub_8010F98 @ JP 0x08010F98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8010F98
	.thumb_func
sub_8010F98:
	push {lr}
	bl sub_80080A4
	ldr r0, _08010FB0 @ =0x085B8EEC
	bl Proc_EndEach
	bl ResetFaces
	bl ClearTalkFaceRefs
	pop {r0}
	bx r0
	.align 2, 0
_08010FB0: .4byte 0x085B8EEC

