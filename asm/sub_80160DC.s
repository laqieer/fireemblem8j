	.syntax unified
	.set StartBgm, 0x08002424 + 1
	.set sub_8015FD4, 0x08015FD4 + 1
	.section .text.sub_80160DC, "ax", %progbits
@ sub_80160DC @ JP 0x080160DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80160DC
	.thumb_func
sub_80160DC:
	push {lr}
	bl sub_8015FD4
	movs r1, #0
	bl StartBgm
	pop {r0}
	bx r0

