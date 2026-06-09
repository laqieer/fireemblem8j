	.syntax unified
	.section .text.AddTrap, "ax", %progbits
@ AddTrap @ JP 0x0802E1F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AddTrap
	.thumb_func
AddTrap:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0802E1FC @ =0x0203A610
	b _0802E202
	.align 2, 0
_0802E1FC: .4byte 0x0203A610
_0802E200:
	adds r1, #8
_0802E202:
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0802E200
	strb r4, [r1]
	strb r5, [r1, #1]
	strb r2, [r1, #2]
	strb r3, [r1, #3]
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1

