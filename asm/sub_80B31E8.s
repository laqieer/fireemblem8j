	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B31E8, "ax", %progbits
@ sub_80B31E8 @ JP 0x080B31E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B31E8
	.thumb_func
sub_80B31E8:
	push {lr}
	ldr r0, _080B3208 @ =0x08A9DD64
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080B3204
	ldr r2, [r1, #0x2c]
	ldrb r0, [r2]
	cmp r0, #6
	bne _080B3204
	adds r0, r2, #0
	adds r0, #0xc
	str r0, [r1, #0x2c]
_080B3204:
	pop {r0}
	bx r0
	.align 2, 0
_080B3208: .4byte 0x08A9DD64

