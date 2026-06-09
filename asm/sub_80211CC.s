	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set SetSecondaryHBlankHandler, 0x08001D3C + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_80211CC, "ax", %progbits
@ sub_80211CC @ JP 0x080211CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80211CC
	.thumb_func
sub_80211CC:
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	movs r0, #0
	bl SetSecondaryHBlankHandler
	ldr r2, _08021208 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
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
	strb r0, [r2, #1]
	ldr r1, _0802120C @ =0x020228A8
	movs r0, #0
	strh r0, [r1]
	bl sub_8001EE4
	pop {r0}
	bx r0
	.align 2, 0
_08021208: .4byte 0x03003020
_0802120C: .4byte 0x020228A8

