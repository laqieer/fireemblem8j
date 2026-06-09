	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8073E74, 0x08073E74 + 1
	.set sub_8073F94, 0x08073F94 + 1
	.section .text.sub_80537D4, "ax", %progbits
@ sub_80537D4 @ JP 0x080537D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80537D4
	.thumb_func
sub_80537D4:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _08053830
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _08053830
	strh r1, [r5, #0x2c]
	ldr r1, [r5, #0x48]
	ldrh r0, [r5, #0x2e]
	adds r0, r0, r1
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	bl GetAnimPosition
	ldr r1, _08053868 @ =0x0203E1A8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r2, [r5, #0x48]
	ldrh r1, [r0]
	adds r1, r1, r2
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x75
	bl sub_8073E74
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0x75
	movs r2, #1
	bl sub_8073F94
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _08053830
	movs r0, #1
	str r0, [r5, #0x58]
_08053830:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne _08053874
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne _08053874
	ldr r4, _0805386C @ =0x0203E14E
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	adds r0, r6, #0
	bl GetAnimPosition
	ldr r1, _08053870 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r5, #0
	bl sub_8002DE4
	b _08053880
	.align 2, 0
_08053868: .4byte 0x0203E1A8
_0805386C: .4byte 0x0203E14E
_08053870: .4byte 0x02017780
_08053874:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls _08053880
	movs r0, #0x1e
	str r0, [r5, #0x54]
_08053880:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

