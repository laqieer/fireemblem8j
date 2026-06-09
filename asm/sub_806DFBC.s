	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_806DFBC, "ax", %progbits
@ sub_806DFBC @ JP 0x0806DFBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806DFBC
	.thumb_func
sub_806DFBC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	mov r8, r1
	adds r6, r2, #0
	adds r4, r3, #0
	ldr r1, _0806E008 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806E00C @ =0x0860329C
	movs r1, #3
	bl sub_8002BCC
	adds r7, r0, #0
	str r5, [r7, #0x5c]
	movs r0, #0
	strh r0, [r7, #0x2c]
	strh r4, [r7, #0x2e]
	str r6, [r7, #0x44]
	ldr r3, _0806E010 @ =0x086E254C
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	adds r4, r0, #0
	str r4, [r7, #0x60]
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806E014
	movs r0, #0x58
	b _0806E016
	.align 2, 0
_0806E008: .4byte 0x0201774C
_0806E00C: .4byte 0x0860329C
_0806E010: .4byte 0x086E254C
_0806E014:
	movs r0, #0x98
_0806E016:
	strh r0, [r4, #2]
	movs r0, #0x58
	strh r0, [r4, #4]
	ldr r0, _0806E038 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806E042
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806E03C
	ldrh r0, [r4, #2]
	subs r0, #0x18
	b _0806E040
	.align 2, 0
_0806E038: .4byte 0x0203E11C
_0806E03C:
	ldrh r0, [r4, #2]
	adds r0, #0x18
_0806E040:
	strh r0, [r4, #2]
_0806E042:
	ldr r0, [r7, #0x44]
	cmp r0, #5
	bhi _0806E094
	lsls r0, r0, #2
	ldr r1, _0806E054 @ =_0806E058
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806E054: .4byte _0806E058
_0806E058: @ jump table
	.4byte _0806E070 @ case 0
	.4byte _0806E076 @ case 1
	.4byte _0806E07C @ case 2
	.4byte _0806E082 @ case 3
	.4byte _0806E088 @ case 4
	.4byte _0806E08E @ case 5
_0806E070:
	ldrh r0, [r4, #2]
	subs r0, #0xc
	b _0806E092
_0806E076:
	ldrh r0, [r4, #2]
	subs r0, #0x18
	b _0806E092
_0806E07C:
	ldrh r0, [r4, #2]
	subs r0, #0x24
	b _0806E092
_0806E082:
	ldrh r0, [r4, #2]
	adds r0, #0xc
	b _0806E092
_0806E088:
	ldrh r0, [r4, #2]
	adds r0, #0x18
	b _0806E092
_0806E08E:
	ldrh r0, [r4, #2]
	adds r0, #0x24
_0806E092:
	strh r0, [r4, #2]
_0806E094:
	mov r0, r8
	cmp r0, #0
	bne _0806E0A4
	ldr r0, _0806E0A0 @ =0x3E000100
	b _0806E0A6
	.align 2, 0
_0806E0A0: .4byte 0x3E000100
_0806E0A4:
	ldr r0, _0806E0B4 @ =0x3C000100
_0806E0A6:
	str r0, [r4, #0x1c]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E0B4: .4byte 0x3C000100

