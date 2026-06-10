	.syntax unified
	.section .text.InitBaseTilesBmMap, "ax", %progbits
@ InitBaseTilesBmMap @ JP 0x0801967C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global InitBaseTilesBmMap
	.thumb_func
InitBaseTilesBmMap:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r3, _08019730 @ =0x085C2E54
	ldr r0, [r3]
	mov sb, r0
	ldr r5, _08019734 @ =0x02001000
	ldr r1, _08019738 @ =0x0202E4D0
	ldrh r0, [r1, #2]
	adds r0, #1
	strh r0, [r1, #2]
	adds r5, #2
	movs r4, #2
	ldrsh r2, [r1, r4]
	lsls r0, r2, #2
	add r0, sb
	mov ip, r0
	movs r4, #0
	mov sl, r1
	cmp r4, r2
	bge _080196F2
	mov r7, sl
_080196AC:
	lsls r3, r4, #2
	mov r1, sb
	adds r0, r3, r1
	mov r1, ip
	str r1, [r0]
	movs r0, #0
	ldrsh r1, [r7, r0]
	lsls r0, r1, #1
	add ip, r0
	movs r2, #0
	adds r6, r4, #1
	cmp r2, r1
	bge _080196E8
	ldr r1, _08019730 @ =0x085C2E54
	mov r8, r1
	adds r4, r3, #0
_080196CC:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r5]
	strh r1, [r0]
	adds r5, #2
	adds r2, #1
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r2, r0
	blt _080196CC
_080196E8:
	adds r4, r6, #0
	movs r1, #2
	ldrsh r0, [r7, r1]
	cmp r4, r0
	blt _080196AC
_080196F2:
	ldr r1, _08019730 @ =0x085C2E54
	ldr r0, [r1]
	lsls r1, r4, #2
	adds r1, r1, r0
	subs r1, #4
	ldr r5, [r1]
	movs r2, #0
	mov r3, sl
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r2, r0
	bge _0801971A
	movs r1, #0
_0801970C:
	strh r1, [r5]
	adds r5, #2
	adds r2, #1
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r2, r0
	blt _0801970C
_0801971A:
	mov r1, sl
	ldrh r0, [r1, #2]
	subs r0, #1
	strh r0, [r1, #2]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019730: .4byte 0x085C2E54
_08019734: .4byte 0x02001000
_08019738: .4byte 0x0202E4D0

