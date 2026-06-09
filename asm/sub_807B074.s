	.syntax unified
	.set GetCameraAdjustedX, 0x080159D4 + 1
	.set GetCameraAdjustedY, 0x08015A18 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_807B180, 0x0807B180 + 1
	.set sub_807B890, 0x0807B890 + 1
	.section .text.sub_807B074, "ax", %progbits
@ sub_807B074 @ JP 0x0807B074 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807B074
	.thumb_func
sub_807B074:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	bl sub_807B890
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r6, #0
	adds r2, #0x48
	ldrh r1, [r2]
	adds r1, r1, r0
	strh r1, [r2]
	adds r4, r6, #0
	adds r4, #0x4c
	ldr r1, _0807B170 @ =0x08A13010
	mov ip, r1
	adds r3, r6, #0
	adds r3, #0x42
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r1, r1, #2
	add r1, ip
	movs r5, #0
	ldrsh r1, [r1, r5]
	muls r1, r0, r1
	ldrh r7, [r4]
	adds r1, r1, r7
	strh r1, [r4]
	adds r5, r6, #0
	adds r5, #0x4e
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #1
	add r1, ip
	movs r7, #0
	ldrsh r1, [r1, r7]
	muls r0, r1, r0
	ldrh r1, [r5]
	adds r0, r0, r1
	strh r0, [r5]
	ldrh r1, [r2]
	lsrs r0, r1, #4
	cmp r0, #0xf
	bls _0807B122
	ldr r7, _0807B174 @ =0xFFFFFF00
	adds r1, r1, r7
	strh r1, [r2]
	ldrh r0, [r2]
	mov r8, r0
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #2
	add r0, ip
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r1, r8
	muls r1, r0, r1
	ldrh r0, [r4]
	subs r0, r0, r1
	strh r0, [r4]
	ldrh r1, [r2]
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	add r0, ip
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r1, r0, r1
	ldrh r0, [r5]
	subs r0, r0, r1
	strh r0, [r5]
	movs r0, #0
	strh r0, [r2]
	ldrh r2, [r4]
	movs r1, #0x10
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r4]
	ldrh r0, [r5]
	ands r1, r0
	strh r1, [r5]
_0807B122:
	adds r0, r6, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807B150
	ldr r0, _0807B178 @ =0x085C29C8
	bl Proc_Find
	cmp r0, #0
	bne _0807B150
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	bl GetCameraAdjustedX
	ldr r4, _0807B17C @ =0x0202BCAC
	strh r0, [r4, #0xc]
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	bl GetCameraAdjustedY
	strh r0, [r4, #0xe]
_0807B150:
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807B164
	adds r0, r6, #0
	bl sub_807B180
_0807B164:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B170: .4byte 0x08A13010
_0807B174: .4byte 0xFFFFFF00
_0807B178: .4byte 0x085C29C8
_0807B17C: .4byte 0x0202BCAC

