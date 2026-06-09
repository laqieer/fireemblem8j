	.syntax unified
	.set BlendPaletteToColor, 0x080CB8BC + 1
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80CC528, "ax", %progbits
@ sub_80CC528 @ JP 0x080CC528 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CC528
	.thumb_func
sub_80CC528:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	movs r0, #0
	ldrsh r3, [r5, r0]
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_8012E84
	adds r4, r0, #0
	ldr r0, _080CC578 @ =0x08B52674
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CC57C @ =0x02022A68
	ldr r1, _080CC580 @ =0x00007FFF
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r2, r4, #0
	bl BlendPaletteToColor
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #0x20
	bne _080CC584
	movs r0, #0
	strh r0, [r5]
	adds r0, r6, #0
	bl sub_8002DE4
	b _080CC588
	.align 2, 0
_080CC578: .4byte 0x08B52674
_080CC57C: .4byte 0x02022A68
_080CC580: .4byte 0x00007FFF
_080CC584:
	adds r0, r1, #1
	strh r0, [r5]
_080CC588:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

