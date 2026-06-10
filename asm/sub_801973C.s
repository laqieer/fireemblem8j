	.syntax unified
	.set sub_802E3A8, 0x0802E3A8 + 1
	.section .text.sub_801973C, "ax", %progbits
@ sub_801973C @ JP 0x0801973C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801973C
	.thumb_func
sub_801973C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	ldr r0, _080197BC @ =0x0202E4D0
	mov sb, r0
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bge _080197AA
	mov r8, sb
	ldr r3, _080197C0 @ =0x085C2E54
	mov sl, r3
_0801975A:
	movs r3, #0
	mov r4, r8
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r6, r1, #1
	cmp r3, r0
	bge _0801979E
	ldr r4, _080197C4 @ =0x0202E4D8
	mov ip, r4
	lsls r4, r1, #2
	ldr r5, _080197C8 @ =0x085C2E50
	mov r7, sl
_08019772:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r2, [r0]
	adds r2, r2, r3
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsrs r1, r1, #2
	ldr r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, #1
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r3, r0
	blt _08019772
_0801979E:
	adds r1, r6, #0
	mov r2, sb
	movs r3, #2
	ldrsh r0, [r2, r3]
	cmp r1, r0
	blt _0801975A
_080197AA:
	bl sub_802E3A8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080197BC: .4byte 0x0202E4D0
_080197C0: .4byte 0x085C2E54
_080197C4: .4byte 0x0202E4D8
_080197C8: .4byte 0x085C2E50

