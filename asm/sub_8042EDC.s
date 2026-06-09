	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8042EDC, "ax", %progbits
@ sub_8042EDC @ JP 0x08042EDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042EDC
	.thumb_func
sub_8042EDC:
	push {lr}
	adds r2, r0, #0
	ldr r0, _08042EFC @ =0x085D31E8
	ldr r0, [r0]
	ldr r1, _08042F00 @ =0x00001286
	strh r1, [r0, #0x30]
	ldr r1, _08042F04 @ =0x00001B7E
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _08042EF8
	adds r0, r2, #0
	bl sub_8002DE4
_08042EF8:
	pop {r0}
	bx r0
	.align 2, 0
_08042EFC: .4byte 0x085D31E8
_08042F00: .4byte 0x00001286
_08042F04: .4byte 0x00001B7E

