	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8053990, "ax", %progbits
@ sub_8053990 @ JP 0x08053990 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8053990
	.thumb_func
sub_8053990:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	mov r8, r0
	ldr r1, [r6, #0x60]
	mov sb, r1
	ldr r4, _080539F4 @ =0x080DF424
	movs r2, #0x2c
	ldrsh r0, [r6, r2]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08053A00
	bl GetBanimDragonStatusType
	cmp r0, #0
	bne _080539EC
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r5, _080539F8 @ =0x02000028
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r4, _080539FC @ =0x0201FB0C
	ldr r1, [r4]
	ldrh r0, [r0]
	subs r0, r0, r1
	mov r1, r8
	strh r0, [r1, #2]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r1, [r4]
	ldrh r0, [r0]
	subs r0, r0, r1
	mov r2, sb
	strh r0, [r2, #2]
_080539EC:
	adds r0, r6, #0
	bl sub_8002DE4
	b _08053A66
	.align 2, 0
_080539F4: .4byte 0x080DF424
_080539F8: .4byte 0x02000028
_080539FC: .4byte 0x0201FB0C
_08053A00:
	mov r0, r8
	bl GetAnimPosition
	cmp r0, #1
	bne _08053A1C
	movs r1, #0x2c
	ldrsh r0, [r6, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	b _08053A28
_08053A1C:
	movs r2, #0x2c
	ldrsh r0, [r6, r2]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r7, [r0, r1]
_08053A28:
	bl GetBanimDragonStatusType
	cmp r0, #0
	bne _08053A60
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r5, _08053A74 @ =0x02000028
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r4, _08053A78 @ =0x0201FB0C
	ldr r1, [r4]
	ldrh r0, [r0]
	subs r0, r0, r1
	adds r0, r7, r0
	mov r2, r8
	strh r0, [r2, #2]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r1, [r4]
	ldrh r0, [r0]
	subs r0, r0, r1
	adds r0, r7, r0
	mov r1, sb
	strh r0, [r1, #2]
_08053A60:
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
_08053A66:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053A74: .4byte 0x02000028
_08053A78: .4byte 0x0201FB0C

