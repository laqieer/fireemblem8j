	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_End, 0x08002CBC + 1
	.set SioStrCpy, 0x08042D4C + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8043438, 0x08043438 + 1
	.set sub_804DFE4, 0x0804DFE4 + 1
	.set sub_80AB258, 0x080AB258 + 1
	.set sub_80AB354, 0x080AB354 + 1
	.section .text.sub_8043644, "ax", %progbits
@ sub_8043644 @ JP 0x08043644 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8043644
	.thumb_func
sub_8043644:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	ldr r7, [r0, #0x40]
	adds r0, #0x53
	ldrb r0, [r0]
	mov r8, r0
	ldr r3, _080436B4 @ =0x0203DB78
	lsls r5, r0, #2
	add r5, r8
	lsls r0, r5, #2
	adds r6, r0, r3
	ldrb r2, [r6, #0xf]
	movs r1, #0x7f
	adds r0, r1, #0
	ands r0, r2
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #2
	adds r4, r4, r3
	ldrb r2, [r4, #0xf]
	ands r1, r2
	bl sub_80AB258
	ldrb r1, [r6, #0x10]
	ldrb r0, [r4, #0x10]
	strb r0, [r6, #0x10]
	strb r1, [r4, #0x10]
	adds r5, #1
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	mov r0, r8
	adds r2, r6, #0
	bl sub_80AB354
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080436B8
	movs r0, #0x61
	bl sub_8009FA8
	adds r1, r6, #0
	bl SioStrCpy
	movs r0, #0x80
	rsbs r0, r0, #0
	adds r1, r0, #0
	mov r0, r8
	orrs r0, r1
	strb r0, [r6, #0xf]
	b _080436BC
	.align 2, 0
_080436B4: .4byte 0x0203DB78
_080436B8:
	mov r1, r8
	strb r1, [r6, #0xf]
_080436BC:
	lsls r4, r7, #2
	adds r4, r4, r7
	adds r0, r4, #1
	bl GetUnit
	adds r1, r0, #0
	lsls r4, r4, #2
	ldr r0, _080436F8 @ =0x0203DB78
	adds r4, r4, r0
	adds r0, r7, #0
	adds r2, r4, #0
	bl sub_80AB354
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080436FC
	movs r0, #0x61
	bl sub_8009FA8
	adds r1, r4, #0
	bl SioStrCpy
	movs r0, #0x80
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r0, r7, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
	b _080436FE
	.align 2, 0
_080436F8: .4byte 0x0203DB78
_080436FC:
	strb r7, [r4, #0xf]
_080436FE:
	adds r0, r7, #0
	bl sub_8043438
	mov r0, r8
	bl sub_8043438
	mov r1, sb
	ldr r0, [r1, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x4a
	ldrh r1, [r1]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_804DFE4
	mov r1, sb
	ldr r0, [r1, #0x30]
	bl Proc_End
	mov r1, sb
	adds r1, #0x52
	movs r0, #4
	strb r0, [r1]
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

