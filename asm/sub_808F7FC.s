	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.section .text.sub_808F7FC, "ax", %progbits
@ sub_808F7FC @ JP 0x0808F7FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808F7FC
	.thumb_func
sub_808F7FC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r1, #0
	mov sl, r2
	ldr r1, _0808F984 @ =0x08A738E0
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #4
	ldrsb r1, [r0, r1]
	mov r8, r1
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov sb, r0
	cmp r1, #0
	bge _0808F86A
	cmp r0, #0
	bge _0808F86A
	ldr r4, _0808F988 @ =0x020234A8
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	ldr r5, _0808F98C @ =0x02022CA8
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	movs r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _0808F990 @ =0x02004254
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl j_TmCopyRect
	movs r0, #0x12
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _0808F994 @ =0x02003D54
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl j_TmCopyRect
_0808F86A:
	mov r0, r8
	cmp r0, #0
	ble _0808F8BA
	mov r1, sb
	cmp r1, #0
	bge _0808F8BA
	ldr r4, _0808F998 @ =0x020234CE
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	ldr r5, _0808F99C @ =0x02022CCE
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	movs r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _0808F990 @ =0x02004254
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl j_TmCopyRect
	movs r0, #0x12
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _0808F994 @ =0x02003D54
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl j_TmCopyRect
_0808F8BA:
	mov r0, r8
	cmp r0, #0
	bge _0808F914
	mov r1, sb
	cmp r1, #0
	ble _0808F914
	ldr r5, _0808F9A0 @ =0x02023828
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	ldr r6, _0808F9A4 @ =0x02023028
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _0808F9A8 @ =0x020044D4
	movs r4, #1
	mov r1, sl
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #0x14
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _0808F9AC @ =0xFFFFFC80
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl j_TmCopyRect
	ldr r0, _0808F9B0 @ =0x02004054
	ldr r1, _0808F9AC @ =0xFFFFFC80
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl j_TmCopyRect
_0808F914:
	mov r0, r8
	cmp r0, #0
	ble _0808F96E
	mov r1, sb
	cmp r1, #0
	ble _0808F96E
	ldr r5, _0808F9B4 @ =0x0202384E
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	ldr r6, _0808F9B8 @ =0x0202304E
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _0808F9A8 @ =0x020044D4
	movs r4, #1
	mov r1, sl
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #0x14
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _0808F9AC @ =0xFFFFFC80
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl j_TmCopyRect
	ldr r0, _0808F9B0 @ =0x02004054
	ldr r1, _0808F9AC @ =0xFFFFFC80
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl j_TmCopyRect
_0808F96E:
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F984: .4byte 0x08A738E0
_0808F988: .4byte 0x020234A8
_0808F98C: .4byte 0x02022CA8
_0808F990: .4byte 0x02004254
_0808F994: .4byte 0x02003D54
_0808F998: .4byte 0x020234CE
_0808F99C: .4byte 0x02022CCE
_0808F9A0: .4byte 0x02023828
_0808F9A4: .4byte 0x02023028
_0808F9A8: .4byte 0x020044D4
_0808F9AC: .4byte 0xFFFFFC80
_0808F9B0: .4byte 0x02004054
_0808F9B4: .4byte 0x0202384E
_0808F9B8: .4byte 0x0202304E

