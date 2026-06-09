	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.section .text.sub_80841EC, "ax", %progbits
@ sub_80841EC @ JP 0x080841EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80841EC
	.thumb_func
sub_80841EC:
	push {lr}
	ldr r3, _0808425C @ =0x03003020
	ldrb r0, [r3, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	subs r0, #0xa2
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2]
	adds r2, #2
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08084260 @ =HBlank_MapAnimWin0H
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_0808425C: .4byte 0x03003020
_08084260: .4byte 0x080842A5  @ HBlank_MapAnimWin0H

