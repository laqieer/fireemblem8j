	.syntax unified
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80CE54C, "ax", %progbits
@ sub_80CE54C @ JP 0x080CE54C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CE54C
	.thumb_func
sub_80CE54C:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #7
	bl sub_80D637C
	adds r3, r0, #0
	movs r0, #7
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl sub_8012E84
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080CE580
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	b _080CE592
_080CE580:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
_080CE592:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #1
	beq _080CE5A4
	cmp r0, #2
	beq _080CE5D8
	b _080CE5F4
_080CE5A4:
	ldr r0, _080CE5C4 @ =0x08B8276C
	ldr r1, _080CE5C8 @ =0x06010000
	bl sub_8013008
	ldr r0, _080CE5CC @ =0x08B830E8
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE5D0 @ =0x08B82D2C
	ldr r1, _080CE5D4 @ =0x06010F00
	bl sub_8013008
	b _080CE5F4
	.align 2, 0
_080CE5C4: .4byte 0x08B8276C
_080CE5C8: .4byte 0x06010000
_080CE5CC: .4byte 0x08B830E8
_080CE5D0: .4byte 0x08B82D2C
_080CE5D4: .4byte 0x06010F00
_080CE5D8:
	ldr r0, _080CE608 @ =0x08B83108
	ldr r1, _080CE60C @ =0x06011E00
	bl sub_8013008
	ldr r0, _080CE610 @ =0x08B839F4
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE614 @ =0x08B8366C
	ldr r1, _080CE618 @ =0x06012D00
	bl sub_8013008
_080CE5F4:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xd
	bne _080CE61C
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CE620
	.align 2, 0
_080CE608: .4byte 0x08B83108
_080CE60C: .4byte 0x06011E00
_080CE610: .4byte 0x08B839F4
_080CE614: .4byte 0x08B8366C
_080CE618: .4byte 0x06012D00
_080CE61C:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CE620:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

