	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.section .text.sub_8003AFC, "ax", %progbits
@ sub_8003AFC @ JP 0x08003AFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003AFC
	.thumb_func
sub_8003AFC:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	b _08003B2E
_08003B06:
	cmp r0, #0x60
	bls _08003B0E
	subs r0, #0x40
	b _08003B10
_08003B0E:
	subs r0, #0x20
_08003B10:
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _08003B3C @ =0x02028E50
	ldr r3, [r0]
	adds r3, r1, r3
	ldr r0, _08003B40 @ =0x02028E54
	ldr r0, [r0]
	adds r3, r3, r0
	adds r0, r5, #0
	adds r1, r6, #0
	ldr r2, _08003B44 @ =0x085B8CDC
	bl CallARM_PushToSecondaryOAM
	adds r5, #8
	adds r4, #1
_08003B2E:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08003B06
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003B3C: .4byte 0x02028E50
_08003B40: .4byte 0x02028E54
_08003B44: .4byte 0x085B8CDC

