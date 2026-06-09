	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8082870, 0x08082870 + 1
	.set sub_80828EC, 0x080828EC + 1
	.section .text.sub_8082D18, "ax", %progbits
@ sub_8082D18 @ JP 0x08082D18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8082D18
	.thumb_func
sub_8082D18:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #2
	bne _08082D38
	ldr r0, [r6, #0x50]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6, #0x50]
	strh r1, [r0, #0x2a]
	b _08082D5C
_08082D38:
	cmp r0, #3
	bne _08082D4A
	ldr r0, [r6, #0x50]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6, #0x50]
	strh r1, [r0, #0x2a]
	b _08082D76
_08082D4A:
	cmp r0, #4
	bne _08082D64
	ldr r0, [r6, #0x50]
	adds r0, #0x29
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6, #0x50]
	strh r2, [r0, #0x2a]
_08082D5C:
	ldr r1, [r6, #0x50]
	movs r0, #3
	strh r0, [r1, #0x34]
	b _08082D8E
_08082D64:
	cmp r0, #5
	bne _08082D7E
	ldr r0, [r6, #0x50]
	adds r0, #0x29
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6, #0x50]
	strh r2, [r0, #0x2a]
_08082D76:
	ldr r1, [r6, #0x50]
	movs r0, #4
	strh r0, [r1, #0x34]
	b _08082D8E
_08082D7E:
	cmp r0, #6
	bne _08082D8E
	ldr r0, [r6, #0x50]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r6, #0x50]
	strh r1, [r0, #0x2a]
_08082D8E:
	adds r0, r6, #0
	adds r0, #0x42
	ldrh r7, [r0]
	mov r8, r0
	movs r0, #0x4a
	adds r0, r0, r6
	mov sb, r0
	cmp r7, #0
	bne _08082DFE
	ldr r1, _08082DE4 @ =0x081F52A8
	adds r5, r6, #0
	adds r5, #0x40
	ldrh r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r4, r6, #0
	adds r4, #0x44
	ldrh r1, [r4]
	bl sub_8082870
	ldrh r0, [r5]
	mov r1, sb
	strh r0, [r1]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	movs r0, #4
	mov r3, r8
	strh r0, [r3]
	adds r1, r6, #0
	adds r1, #0x46
	ldrh r0, [r1]
	cmp r0, #0xa
	bls _08082DE8
	ldrh r0, [r5]
	cmp r0, #3
	bls _08082DF6
	strh r7, [r5]
	strh r7, [r1]
	adds r0, r6, #0
	bl sub_8002DE4
	b _08082DF6
	.align 2, 0
_08082DE4: .4byte 0x081F52A8
_08082DE8:
	ldrh r0, [r5]
	cmp r0, #3
	bls _08082DF6
	strh r7, [r5]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08082DF6:
	ldrh r0, [r4]
	movs r1, #1
	eors r0, r1
	strh r0, [r4]
_08082DFE:
	mov r4, r8
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	adds r2, r6, #0
	adds r2, #0x48
	ldrh r1, [r2]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0x95
	bgt _08082E18
	adds r0, r1, #1
	strh r0, [r2]
_08082E18:
	mov r4, sb
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _08082E46
	ldr r1, _08082E54 @ =0x081F52A8
	adds r0, r0, r1
	ldrb r5, [r0]
	adds r0, r6, #0
	adds r0, #0x44
	ldrh r4, [r0]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #5
	movs r1, #0x96
	bl __divsi3
	movs r2, #0x20
	subs r2, r2, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80828EC
_08082E46:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082E54: .4byte 0x081F52A8

