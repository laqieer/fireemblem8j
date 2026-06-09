	.syntax unified
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_809D650, "ax", %progbits
@ sub_809D650 @ JP 0x0809D650 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809D650
	.thumb_func
sub_809D650:
	push {lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r3, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl sub_80B1FBC
	pop {r0}
	bx r0
	.align 2, 0

