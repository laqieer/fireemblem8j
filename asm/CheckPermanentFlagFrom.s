	.syntax unified
	.section .text.CheckPermanentFlagFrom, "ax", %progbits
@ CheckPermanentFlagFrom @ JP 0x0808605C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CheckPermanentFlagFrom
	.thumb_func
CheckPermanentFlagFrom:
	push {lr}
	adds r3, r0, #0
	cmp r3, #0x64
	ble _08086084
	subs r3, #0x65
	adds r0, r3, #0
	cmp r3, #0
	bge _0808606E
	adds r0, r3, #7
_0808606E:
	asrs r0, r0, #3
	adds r2, r1, r0
	ldr r1, _08086088 @ =0x08A5A6A0
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne _0808608C
_08086084:
	movs r0, #0
	b _0808608E
	.align 2, 0
_08086088: .4byte 0x08A5A6A0
_0808608C:
	movs r0, #1
_0808608E:
	pop {r1}
	bx r1
	.align 2, 0

