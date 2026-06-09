	.syntax unified
	.set RemoveSioPid, 0x080975F4 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80976D0, 0x080976D0 + 1
	.set sub_809C84C, 0x0809C84C + 1
	.section .text.sub_809CF0C, "ax", %progbits
@ sub_809CF0C @ JP 0x0809CF0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809CF0C
	.thumb_func
sub_809CF0C:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_80976D0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809CF60
	adds r1, r5, #0
	adds r1, #0x29
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl RemoveSioPid
	ldr r0, _0809CF5C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CF4C
	movs r0, #0x6b
	bl m4aSongNumStart
_0809CF4C:
	ldrh r1, [r5, #0x2e]
	lsrs r1, r1, #1
	adds r0, r5, #0
	bl sub_809C84C
	movs r0, #1
	b _0809CF74
	.align 2, 0
_0809CF5C: .4byte 0x0202BCEC
_0809CF60:
	ldr r0, _0809CF7C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CF72
	movs r0, #0x6c
	bl m4aSongNumStart
_0809CF72:
	movs r0, #0
_0809CF74:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809CF7C: .4byte 0x0202BCEC

