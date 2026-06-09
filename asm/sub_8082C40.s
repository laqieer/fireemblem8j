	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8082C40, "ax", %progbits
@ sub_8082C40 @ JP 0x08082C40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8082C40
	.thumb_func
sub_8082C40:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x42
	ldrh r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	bne _08082D04
	adds r3, r2, #0
	adds r3, #0x40
	ldrh r1, [r3]
	lsls r0, r1, #0x12
	lsrs r7, r0, #0x10
	mov sb, r3
	cmp r1, #7
	bhi _08082CE4
	movs r6, #1
	adds r2, #0x44
	mov r8, r2
	ldr r0, _08082CDC @ =0x081F5294
	mov sl, r0
	movs r1, #0x1f
	mov ip, r1
_08082C76:
	mov r1, r8
	ldrh r0, [r1]
	add r0, sl
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r6
	lsls r0, r0, #1
	ldr r1, _08082CE0 @ =0x020228A8
	adds r5, r0, r1
	ldrh r1, [r5]
	adds r4, r1, #0
	movs r0, #0x1f
	ands r0, r1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1f
	bls _08082C9C
	movs r2, #0x1f
_08082C9C:
	lsrs r0, r1, #5
	mov r1, ip
	ands r0, r1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x1f
	bls _08082CAE
	movs r3, #0x1f
_08082CAE:
	lsrs r0, r4, #0xa
	mov r1, ip
	ands r0, r1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x1f
	bls _08082CC0
	movs r1, #0x1f
_08082CC0:
	lsls r0, r3, #5
	orrs r2, r0
	lsls r0, r1, #0xa
	orrs r2, r0
	strh r2, [r5]
	adds r6, #1
	cmp r6, #0xf
	ble _08082C76
	bl sub_8001EE4
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #1
	b _08082D06
	.align 2, 0
_08082CDC: .4byte 0x081F5294
_08082CE0: .4byte 0x020228A8
_08082CE4:
	strh r4, [r3]
	adds r0, r2, #0
	adds r0, #0x46
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r1, r2, #0
	adds r1, #0x4a
	ldr r0, _08082D00 @ =0x0000FFFF
	strh r0, [r1]
	adds r0, r2, #0
	bl sub_8002DE4
	b _08082D08
	.align 2, 0
_08082D00: .4byte 0x0000FFFF
_08082D04:
	subs r0, #1
_08082D06:
	strh r0, [r1]
_08082D08:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

