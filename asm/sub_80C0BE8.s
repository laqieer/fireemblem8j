	.syntax unified
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80C0BE8, "ax", %progbits
@ sub_80C0BE8 @ JP 0x080C0BE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C0BE8
	.thumb_func
sub_80C0BE8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov r8, r1
	adds r4, r2, #0
	mov sb, r3
	ldr r0, [sp, #0x20]
	bl sub_8001BC0
	mov ip, r0
	cmp r6, r4
	beq _080C0C5A
	cmp r6, r4
	ble _080C0C18
	adds r0, r6, #0
	adds r0, #0x1e
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov r2, r8
	lsls r0, r2, #0x10
	b _080C0C20
_080C0C18:
	lsls r0, r6, #0x10
	lsrs r1, r0, #0x10
	mov r3, r8
	lsls r0, r3, #0x10
_080C0C20:
	lsrs r2, r0, #0x10
	movs r7, #0x1f
	ands r7, r1
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080C0C70 @ =0x02019D00
	adds r5, r0, r1
	movs r1, #0
	movs r0, #0x1f
	mov sl, r0
_080C0C3A:
	adds r0, r2, r1
	mov r3, sl
	ands r0, r3
	lsls r0, r0, #5
	adds r0, r0, r7
	lsls r0, r0, #1
	mov r3, ip
	adds r4, r3, r0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r5, #0x78
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x14
	bls _080C0C3A
_080C0C5A:
	cmp r8, sb
	beq _080C0CE4
	cmp r8, sb
	ble _080C0C74
	lsls r0, r6, #0x10
	lsrs r1, r0, #0x10
	mov r0, r8
	adds r0, #0x14
	lsls r0, r0, #0x10
	b _080C0C7C
	.align 2, 0
_080C0C70: .4byte 0x02019D00
_080C0C74:
	lsls r0, r6, #0x10
	lsrs r1, r0, #0x10
	mov r2, r8
	lsls r0, r2, #0x10
_080C0C7C:
	lsrs r2, r0, #0x10
	movs r3, #0x1f
	mov r8, r3
	adds r7, r1, #0
	ands r7, r3
	adds r3, r2, #0
	mov r0, r8
	ands r3, r0
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080C0CBC @ =0x02019D00
	adds r5, r0, r1
	movs r0, #0x20
	subs r0, r0, r7
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x1e
	bls _080C0CC0
	lsls r0, r3, #5
	adds r0, r0, r7
	lsls r0, r0, #1
	mov r1, ip
	adds r4, r1, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x1f
	bl sub_80D6370
	b _080C0CE4
	.align 2, 0
_080C0CBC: .4byte 0x02019D00
_080C0CC0:
	lsls r0, r3, #6
	mov r2, ip
	adds r4, r2, r0
	lsls r1, r7, #1
	adds r1, r4, r1
	adds r0, r5, #0
	adds r2, r6, #0
	bl sub_80D6370
	lsls r0, r6, #1
	adds r0, r5, r0
	mov r3, r8
	subs r2, r3, r6
	ldr r1, _080C0CF4 @ =0x001FFFFF
	ands r2, r1
	adds r1, r4, #0
	bl sub_80D6370
_080C0CE4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C0CF4: .4byte 0x001FFFFF

