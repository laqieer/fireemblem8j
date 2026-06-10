	.syntax unified
	.section .text.CountDownTraps, "ax", %progbits
@ CountDownTraps @ JP 0x0802E8E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CountDownTraps
	.thumb_func
CountDownTraps:
	push {lr}
	ldr r1, _0802E8E8 @ =0x0203A610
	b _0802E8FE
	.align 2, 0
_0802E8E8: .4byte 0x0203A610
_0802E8EC:
	ldrb r0, [r1, #2]
	cmp r0, #7
	bgt _0802E8FC
	cmp r0, #4
	blt _0802E8FC
	ldrb r0, [r1, #6]
	subs r0, #1
	strb r0, [r1, #6]
_0802E8FC:
	adds r1, #8
_0802E8FE:
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0802E8EC
	pop {r0}
	bx r0

