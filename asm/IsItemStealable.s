	.syntax unified
	.section .text.IsItemStealable, "ax", %progbits
@ IsItemStealable @ JP 0x08016DFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global IsItemStealable
	.thumb_func
IsItemStealable:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _08016E08
	movs r1, #0xff
	b _08016E18
_08016E08:
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016E24 @ =0x0885E068
	adds r1, r1, r0
	ldrb r1, [r1, #7]
_08016E18:
	movs r0, #0
	cmp r1, #9
	bne _08016E20
	movs r0, #1
_08016E20:
	pop {r1}
	bx r1
	.align 2, 0
_08016E24: .4byte 0x0885E068

