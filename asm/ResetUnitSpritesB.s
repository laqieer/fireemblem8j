	.syntax unified
	.section .text.ResetUnitSpritesB, "ax", %progbits
@ ResetUnitSpritesB @ JP 0x08026660 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ResetUnitSpritesB
	.thumb_func
ResetUnitSpritesB:
	push {r4, r5, r6, lr}
	movs r2, #0xcf
	ldr r5, _08026688 @ =0x0203A010
	ldr r6, _0802668C @ =0x0203A00C
	ldr r4, _08026690 @ =0x02033F3C
	movs r3, #0xff
_0802666C:
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	subs r2, #1
	cmp r2, #0
	bge _0802666C
	movs r0, #0
	str r0, [r5]
	movs r0, #0x5f
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08026688: .4byte 0x0203A010
_0802668C: .4byte 0x0203A00C
_08026690: .4byte 0x02033F3C

