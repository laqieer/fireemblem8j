	.syntax unified
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_80014A4, "ax", %progbits
@ sub_80014A4 @ JP 0x080014A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80014A4
	.thumb_func
sub_80014A4:
	push {lr}
	ldr r2, _080014C8 @ =0x03000014
	ldr r1, _080014CC @ =0x03000015
	movs r0, #0
	strb r0, [r1]
	strb r0, [r2]
	ldr r0, _080014D0 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r2, _080014D4 @ =0x0300000C
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080014C8: .4byte 0x03000014
_080014CC: .4byte 0x03000015
_080014D0: .4byte 0x02022CA8
_080014D4: .4byte 0x0300000C

