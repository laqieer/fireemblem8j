	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_807DD70, 0x0807DD70 + 1
	.set sub_807DE88, 0x0807DE88 + 1
	.section .text.sub_807E098, "ax", %progbits
@ sub_807E098 @ JP 0x0807E098 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807E098
	.thumb_func
sub_807E098:
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r2, _0807E104 @ =0x0203E1EC
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, r0, r2
	ldrh r0, [r5, #0xe]
	lsrs r3, r0, #4
	movs r6, #0
	cmp r3, #0x63
	ble _0807E0B2
	movs r6, #1
_0807E0B2:
	ldrb r0, [r5, #0x11]
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #3
	ldrb r1, [r5, #0x10]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r4, _0807E108 @ =0x02022CA8
	adds r0, r0, r4
	ldr r2, _0807E10C @ =0x00005020
	movs r1, #0
	str r1, [sp]
	str r6, [sp, #4]
	adds r1, r3, #0
	movs r3, #3
	bl sub_807DD70
	ldrb r0, [r5, #0x11]
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #4
	ldrb r1, [r5, #0x10]
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrb r1, [r5, #0xc]
	ldrh r2, [r5, #0xe]
	lsrs r2, r2, #4
	ldr r3, _0807E110 @ =0x08A13CD0
	str r3, [sp]
	movs r3, #0
	bl sub_807DE88
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E104: .4byte 0x0203E1EC
_0807E108: .4byte 0x02022CA8
_0807E10C: .4byte 0x00005020
_0807E110: .4byte 0x08A13CD0

