	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.sub_808A488, "ax", %progbits
@ sub_808A488 @ JP 0x0808A488 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808A488
	.thumb_func
sub_808A488:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _0808A560 @ =0x00004640
	mov sb, r0
	ldrh r1, [r7, #0x32]
	ldrh r2, [r7, #0x2e]
	adds r0, r1, r2
	strh r0, [r7, #0x2e]
	ldrh r0, [r7, #0x34]
	ldrh r2, [r7, #0x30]
	adds r0, r0, r2
	strh r0, [r7, #0x30]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0808A4B4
	subs r0, r1, #1
	strh r0, [r7, #0x32]
_0808A4B4:
	ldrh r1, [r7, #0x34]
	movs r2, #0x34
	ldrsh r0, [r7, r2]
	cmp r0, #4
	ble _0808A4C2
	subs r0, r1, #1
	strh r0, [r7, #0x34]
_0808A4C2:
	bl sub_8000CD8
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0808A4EA
	ldrh r1, [r7, #0x2a]
	movs r2, #0x2a
	ldrsh r0, [r7, r2]
	cmp r0, #0x66
	bgt _0808A4DC
	adds r0, r1, #1
	strh r0, [r7, #0x2a]
_0808A4DC:
	ldrh r1, [r7, #0x2c]
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	cmp r0, #0xd9
	ble _0808A4EA
	subs r0, r1, #1
	strh r0, [r7, #0x2c]
_0808A4EA:
	ldr r6, _0808A564 @ =0x02003BFC
	movs r0, #4
	ldrsh r5, [r6, r0]
	movs r1, #0x2a
	ldrsh r0, [r7, r1]
	adds r5, r5, r0
	movs r2, #6
	ldrsh r4, [r6, r2]
	adds r4, #3
	ldr r0, _0808A568 @ =0x085B8CFC
	mov r8, r0
	ldrh r0, [r7, #0x2e]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0x5a
	add r0, sb
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSprite
	movs r1, #4
	ldrsh r5, [r6, r1]
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	adds r5, r5, r0
	movs r0, #6
	ldrsh r4, [r6, r0]
	adds r4, #3
	ldr r6, _0808A56C @ =0x085B8D4C
	ldrh r0, [r7, #0x30]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0x5a
	add r0, sb
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A560: .4byte 0x00004640
_0808A564: .4byte 0x02003BFC
_0808A568: .4byte 0x085B8CFC
_0808A56C: .4byte 0x085B8D4C

