	.syntax unified
	.section .text.sub_8001870, "ax", %progbits
@ sub_8001870 @ JP 0x08001870 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8001870
	.thumb_func
sub_8001870:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0x1f
	ldr r2, _080018E4 @ =0x020228A8
	mov sb, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r6, _080018E8 @ =0x020222A8
	movs r7, #0x1f
_0800188A:
	ldr r2, _080018EC @ =0x02022288
	adds r0, r1, r2
	mov r2, sl
	strb r2, [r0]
	movs r5, #0
	lsls r0, r1, #4
	mov ip, r0
	subs r1, #1
	mov r8, r1
_0800189C:
	mov r2, ip
	adds r1, r2, r5
	lsls r3, r1, #1
	adds r1, r3, r1
	adds r4, r1, r6
	add r3, sb
	ldrb r2, [r3]
	adds r0, r7, #0
	ands r0, r2
	strb r0, [r4]
	adds r2, r1, #1
	adds r2, r2, r6
	ldrh r0, [r3]
	lsrs r0, r0, #5
	ands r0, r7
	strb r0, [r2]
	adds r1, #2
	adds r1, r1, r6
	ldrh r0, [r3]
	lsrs r0, r0, #0xa
	ands r0, r7
	strb r0, [r1]
	adds r5, #1
	cmp r5, #0xf
	ble _0800189C
	mov r1, r8
	cmp r1, #0
	bge _0800188A
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080018E4: .4byte 0x020228A8
_080018E8: .4byte 0x020222A8
_080018EC: .4byte 0x02022288

