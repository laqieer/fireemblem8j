	.syntax unified
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80CE890, "ax", %progbits
@ sub_80CE890 @ JP 0x080CE890 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CE890
	.thumb_func
sub_80CE890:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #4
	bl sub_80D637C
	adds r3, r0, #0
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl sub_8012E84
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080CE8C4
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	b _080CE8D6
_080CE8C4:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
_080CE8D6:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080CE924
	cmp r0, #2
	bgt _080CE8EC
	cmp r0, #1
	beq _080CE8F2
	b _080CE974
_080CE8EC:
	cmp r0, #3
	beq _080CE958
	b _080CE974
_080CE8F2:
	ldr r0, _080CE910 @ =0x08B87F4C
	ldr r1, _080CE914 @ =0x06010000
	bl sub_8013008
	ldr r0, _080CE918 @ =0x08B88894
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE91C @ =0x08B88578
	ldr r1, _080CE920 @ =0x06010F00
	bl sub_8013008
	b _080CE974
	.align 2, 0
_080CE910: .4byte 0x08B87F4C
_080CE914: .4byte 0x06010000
_080CE918: .4byte 0x08B88894
_080CE91C: .4byte 0x08B88578
_080CE920: .4byte 0x06010F00
_080CE924:
	ldr r0, _080CE944 @ =0x08B888B4
	ldr r1, _080CE948 @ =0x06011E00
	bl sub_8013008
	ldr r0, _080CE94C @ =0x08B89248
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE950 @ =0x08B88F48
	ldr r1, _080CE954 @ =0x06012D00
	bl sub_8013008
	b _080CE974
	.align 2, 0
_080CE944: .4byte 0x08B888B4
_080CE948: .4byte 0x06011E00
_080CE94C: .4byte 0x08B89248
_080CE950: .4byte 0x08B88F48
_080CE954: .4byte 0x06012D00
_080CE958:
	ldr r0, _080CE988 @ =0x08B89268
	ldr r1, _080CE98C @ =0x06013C00
	bl sub_8013008
	ldr r0, _080CE990 @ =0x08B89AF8
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE994 @ =0x08B89790
	ldr r1, _080CE998 @ =0x06014B00
	bl sub_8013008
_080CE974:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080CE99C
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CE9A0
	.align 2, 0
_080CE988: .4byte 0x08B89268
_080CE98C: .4byte 0x06013C00
_080CE990: .4byte 0x08B89AF8
_080CE994: .4byte 0x08B89790
_080CE998: .4byte 0x06014B00
_080CE99C:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CE9A0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

