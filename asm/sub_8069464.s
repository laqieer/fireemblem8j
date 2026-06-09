	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set efxMaohFlash_GetSideXOffset, 0x08069010 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8069464, "ax", %progbits
@ sub_8069464 @ JP 0x08069464 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8069464
	.thumb_func
sub_8069464:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov sb, r3
	ldr r0, _080694E0 @ =0x080E3C20
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _080694E4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080694E8 @ =0x08602428
	movs r1, #3
	bl sub_8002BCC
	adds r6, r0, #0
	adds r0, r4, #0
	bl GetAnimAnotherSide
	str r0, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	lsls r0, r7, #2
	add r0, sp
	adds r0, #4
	ldr r3, [r0]
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r5, r4, #0
	cmp r7, #0
	beq _080694EC
	adds r0, r7, #0
	bl efxMaohFlash_GetSideXOffset
	adds r0, #0xf0
	mov r1, r8
	subs r0, r0, r1
	b _080694F4
	.align 2, 0
_080694E0: .4byte 0x080E3C20
_080694E4: .4byte 0x0201774C
_080694E8: .4byte 0x08602428
_080694EC:
	movs r0, #0
	bl efxMaohFlash_GetSideXOffset
	add r0, r8
_080694F4:
	strh r0, [r4, #2]
	strh r0, [r5, #2]
	ldr r1, [r6, #0x60]
	mov r2, sb
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r4, #4]
	strh r0, [r1, #4]
	ldrh r1, [r4, #8]
	ldr r0, _08069534 @ =0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
	ldr r0, _08069538 @ =0x087FA744
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0806953C @ =0x087FA3F4
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069534: .4byte 0x0000F3FF
_08069538: .4byte 0x087FA744
_0806953C: .4byte 0x087FA3F4

