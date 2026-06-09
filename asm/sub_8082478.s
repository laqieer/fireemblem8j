	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001570, 0x08001570 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.section .text.sub_8082478, "ax", %progbits
@ sub_8082478 @ JP 0x08082478 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8082478
	.thumb_func
sub_8082478:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	adds r0, #0x42
	str r0, [sp, #4]
	ldrh r1, [r0]
	str r1, [sp, #8]
	cmp r1, #0
	beq _08082494
	b _080825AC
_08082494:
	mov r7, sb
	adds r7, #0x40
	ldrh r0, [r7]
	lsls r0, r0, #2
	ldr r2, _0808257C @ =0x081F526C
	adds r0, r0, r2
	ldrb r0, [r0]
	ldr r1, _08082580 @ =0x08A14A5C
	mov sl, r1
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r4, r1
	ldr r0, [r0]
	ldr r2, _08082584 @ =0x081F5260
	mov r8, r2
	mov r5, sb
	adds r5, #0x44
	ldrh r1, [r5]
	lsls r1, r1, #2
	add r1, r8
	ldr r1, [r1]
	lsls r1, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_8013008
	mov r0, sl
	adds r0, #8
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r6, _08082588 @ =0x02020188
	adds r1, r6, #0
	bl sub_8013008
	ldr r0, _0808258C @ =0x02023CA8
	ldrh r3, [r5]
	lsls r1, r3, #2
	add r1, r8
	ldr r2, [r1]
	ldr r1, _08082590 @ =0x081F5268
	mov r8, r1
	add r3, r8
	ldrb r1, [r3]
	lsls r1, r1, #0xc
	orrs r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001570
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r2, _08082594 @ =0x08A14A60
	adds r4, r4, r2
	ldr r0, [r4]
	ldrh r1, [r5]
	add r1, r8
	ldrb r1, [r1]
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_8000D68
	bl sub_8001EE4
	ldr r0, _08082598 @ =0x08A14B14
	bl Proc_Find
	adds r6, r0, #0
	adds r6, #0x29
	movs r1, #1
	mov r8, r1
	mov r2, r8
	strb r2, [r6]
	ldrh r1, [r7]
	lsls r1, r1, #2
	ldr r2, _0808257C @ =0x081F526C
	adds r1, r1, r2
	ldrb r1, [r1, #2]
	adds r4, r0, #0
	adds r4, #0x2a
	strb r1, [r4]
	ldrh r0, [r7]
	cmp r0, #0
	bne _08082552
	ldr r0, _0808259C @ =0x0000013F
	mov r2, sb
	ldr r1, [r2, #0x30]
	bl sub_8014B50
_08082552:
	ldrh r0, [r7]
	lsls r0, r0, #2
	ldr r1, _0808257C @ =0x081F526C
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	ldr r2, [sp, #4]
	strh r0, [r2]
	ldrh r0, [r7]
	cmp r0, #6
	bls _080825A0
	mov r0, r8
	strb r0, [r6]
	movs r0, #0
	strb r0, [r4]
	mov r1, sp
	ldrh r1, [r1, #8]
	strh r1, [r7]
	mov r0, sb
	bl sub_8002DE4
	b _080825AC
	.align 2, 0
_0808257C: .4byte 0x081F526C
_08082580: .4byte 0x08A14A5C
_08082584: .4byte 0x081F5260
_08082588: .4byte 0x02020188
_0808258C: .4byte 0x02023CA8
_08082590: .4byte 0x081F5268
_08082594: .4byte 0x08A14A60
_08082598: .4byte 0x08A14B14
_0808259C: .4byte 0x0000013F
_080825A0:
	adds r0, #1
	strh r0, [r7]
	ldrh r0, [r5]
	movs r1, #1
	eors r0, r1
	strh r0, [r5]
_080825AC:
	mov r1, sb
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

