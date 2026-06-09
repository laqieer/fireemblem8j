	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.section .text.sub_809DAF4, "ax", %progbits
@ sub_809DAF4 @ JP 0x0809DAF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809DAF4
	.thumb_func
sub_809DAF4:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r0, r7, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _0809DB2A
_0809DB08:
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r4, #0x80
	adds r5, #1
	cmp r5, r6
	blt _0809DB08
_0809DB2A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

