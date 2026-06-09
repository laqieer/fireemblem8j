	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8088160, "ax", %progbits
@ sub_8088160 @ JP 0x08088160 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8088160
	.thumb_func
sub_8088160:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r0, #2
	mov ip, r0
	mov r1, sl
	adds r1, #0x4c
	str r1, [sp]
	ldr r2, _08088248 @ =0x020234A8
	mov r8, r2
_0808817C:
	movs r6, #0xe
	mov r7, ip
	lsls r0, r7, #1
	movs r1, #1
	rsbs r1, r1, #0
	add r1, ip
	mov sb, r1
	adds r1, r0, #7
	lsls r2, r1, #5
	adds r0, #8
	lsls r3, r0, #5
	adds r3, #0x1d
	lsls r0, r0, #6
	add r0, r8
	adds r5, r0, #0
	adds r5, #0x38
	adds r2, #0x1d
	lsls r1, r1, #6
	add r1, r8
	adds r4, r1, #0
	adds r4, #0x38
	lsls r2, r2, #1
	add r2, r8
	lsls r3, r3, #1
	add r3, r8
_080881AE:
	ldr r7, [sp]
	movs r1, #0
	ldrsh r0, [r7, r1]
	subs r0, r6, r0
	adds r0, #0xe
	mov r7, ip
	subs r1, r0, r7
	cmp r1, #0x10
	ble _080881C2
	movs r1, #0x10
_080881C2:
	cmp r1, #0
	bge _080881C8
	movs r1, #0
_080881C8:
	movs r0, #0x10
	subs r1, r0, r1
	movs r0, #0xfe
	ands r1, r0
	movs r7, #0xa2
	lsls r7, r7, #7
	adds r0, r7, #0
	adds r0, r1, r0
	strh r0, [r4]
	adds r7, #1
	adds r0, r7, #0
	adds r0, r1, r0
	strh r0, [r2]
	adds r7, #0x1f
	adds r0, r1, r7
	strh r0, [r5]
	adds r7, #1
	adds r0, r1, r7
	strh r0, [r3]
	subs r3, #4
	subs r5, #4
	subs r2, #4
	subs r4, #4
	subs r6, #1
	cmp r6, #0
	bge _080881AE
	mov ip, sb
	mov r0, ip
	cmp r0, #0
	bge _0808817C
	ldr r1, [sp]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r2, [sp]
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r0, #0x1c
	bne _08088238
	movs r0, #0
	strh r0, [r2]
	ldr r0, _0808824C @ =0x08A60B60
	mov r1, sl
	bl sub_8002BCC
	mov r1, sl
	adds r1, #0x64
	ldrh r1, [r1]
	adds r0, #0x64
	strh r1, [r0]
	mov r0, sl
	bl sub_8002DE4
_08088238:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088248: .4byte 0x020234A8
_0808824C: .4byte 0x08A60B60

