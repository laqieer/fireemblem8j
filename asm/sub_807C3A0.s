	.syntax unified
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_80181B0, 0x080181B0 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_807C8DC, 0x0807C8DC + 1
	.section .text.sub_807C3A0, "ax", %progbits
@ sub_807C3A0 @ JP 0x0807C3A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807C3A0
	.thumb_func
sub_807C3A0:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	asrs r2, r2, #0xd
	subs r2, #8
	adds r1, r1, r2
	ldrb r2, [r1]
	lsls r2, r2, #0x1a
	ldrh r0, [r1]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1a
	lsls r0, r0, #0x10
	lsrs r2, r2, #0x1a
	orrs r2, r0
	str r2, [sp]
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r5, #0x10]
	asrs r2, r2, #0x10
	strb r2, [r5, #0x11]
	mov r4, sp
	adds r0, r5, #0
	mov r1, sp
	adds r2, r3, #0
	bl sub_807C8DC
	mov r0, sp
	ldrh r0, [r0]
	strb r0, [r5, #0x10]
	ldrh r0, [r4, #2]
	strb r0, [r5, #0x11]
	adds r0, r5, #0
	bl sub_80181B0
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807C404
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0xc]
	bl RefreshEntityBmMaps
	bl sub_8027144
_0807C404:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

