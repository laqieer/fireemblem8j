	.syntax unified
	.section .text.ClearTraps, "ax", %progbits
@ ClearTraps @ JP 0x0802E100 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClearTraps
	.thumb_func
ClearTraps:
	push {r4, lr}
	ldr r3, _0802E120 @ =0x0203A810
	ldr r1, _0802E124 @ =0x0203A610
	movs r2, #0
	movs r4, #0xfc
	lsls r4, r4, #1
	adds r0, r1, r4
_0802E10E:
	strb r2, [r0, #2]
	subs r0, #8
	cmp r0, r1
	bge _0802E10E
	movs r0, #0
	strb r0, [r3, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E120: .4byte 0x0203A810
_0802E124: .4byte 0x0203A610

