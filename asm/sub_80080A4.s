	.syntax unified
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_80080E8, 0x080080E8 + 1
	.set sub_8008E10, 0x08008E10 + 1
	.section .text.sub_80080A4, "ax", %progbits
@ sub_80080A4 @ JP 0x080080A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80080A4
	.thumb_func
sub_80080A4:
	push {lr}
	ldr r0, _080080DC @ =0x085B90D4
	ldr r1, [r0]
	movs r0, #0xff
	strb r0, [r1, #0xf]
	ldr r0, _080080E0 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	movs r0, #2
	bl sub_8008E10
	bl sub_80080E8
	ldr r2, _080080E4 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_080080DC: .4byte 0x085B90D4
_080080E0: .4byte 0x020234A8
_080080E4: .4byte 0x03003020

