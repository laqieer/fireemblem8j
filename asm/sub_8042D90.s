	.syntax unified
	.set sub_8041818, 0x08041818 + 1
	.set sub_8041880, 0x08041880 + 1
	.section .text.sub_8042D90, "ax", %progbits
@ sub_8042D90 @ JP 0x08042D90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042D90
	.thumb_func
sub_8042D90:
	push {lr}
	bl sub_8041880
	bl sub_8041818
	ldr r2, _08042DAC @ =0x085D31E8
	ldr r1, [r2]
	movs r3, #0
	movs r0, #1
	strb r0, [r1, #1]
	ldr r0, [r2]
	strh r3, [r0, #4]
	pop {r0}
	bx r0
	.align 2, 0
_08042DAC: .4byte 0x085D31E8

