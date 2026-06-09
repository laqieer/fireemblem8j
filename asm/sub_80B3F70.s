	.syntax unified
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80B3F70, "ax", %progbits
@ sub_80B3F70 @ JP 0x080B3F70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3F70
	.thumb_func
sub_80B3F70:
	push {lr}
	adds r2, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x60
	lsrs r1, r1, #2
	lsls r1, r1, #4
	ldrh r2, [r2, #0x2a]
	subs r2, #0x40
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #2
	bl sub_80B1FBC
	pop {r0}
	bx r0

