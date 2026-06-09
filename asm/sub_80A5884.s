	.syntax unified
	.set GetSupportScreenCharIdAt, 0x080A492C + 1
	.set GetSupportScreenPartnerCharId, 0x080A4908 + 1
	.set sub_8085AC8, 0x08085AC8 + 1
	.section .text.sub_80A5884, "ax", %progbits
@ sub_80A5884 @ JP 0x080A5884 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A5884
	.thumb_func
sub_80A5884:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	bl GetSupportScreenCharIdAt
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetSupportScreenPartnerCharId
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	adds r1, r4, #0
	mov r3, r8
	bl sub_8085AC8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

