	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_807F114, 0x0807F114 + 1
	.section .text.sub_8083CB0, "ax", %progbits
@ sub_8083CB0 @ JP 0x08083CB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8083CB0
	.thumb_func
sub_8083CB0:
	push {lr}
	ldr r2, _08083CD4 @ =0x0203E1EC
	ldrb r0, [r2, #0xd]
	ldrb r1, [r2, #0xc]
	cmp r0, r1
	blo _08083CD8
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	bl sub_807F114
	b _08083CDE
	.align 2, 0
_08083CD4: .4byte 0x0203E1EC
_08083CD8:
	ldr r0, _08083CE4 @ =0x08A157AC
	bl Proc_EndEach
_08083CDE:
	pop {r0}
	bx r0
	.align 2, 0
_08083CE4: .4byte 0x08A157AC

