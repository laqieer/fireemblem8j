	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806DF14, "ax", %progbits
@ sub_806DF14 @ JP 0x0806DF14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806DF14
	.thumb_func
sub_806DF14:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x44]
	cmp r0, #5
	bhi _0806DF74
	lsls r0, r0, #2
	ldr r1, _0806DF28 @ =_0806DF2C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806DF28: .4byte _0806DF2C
_0806DF2C: @ jump table
	.4byte _0806DF44 @ case 0
	.4byte _0806DF4C @ case 1
	.4byte _0806DF54 @ case 2
	.4byte _0806DF5C @ case 3
	.4byte _0806DF64 @ case 4
	.4byte _0806DF6C @ case 5
_0806DF44:
	ldr r1, [r4, #0x60]
	ldrh r0, [r1, #2]
	subs r0, #2
	b _0806DF72
_0806DF4C:
	ldr r1, [r4, #0x60]
	ldrh r0, [r1, #2]
	subs r0, #3
	b _0806DF72
_0806DF54:
	ldr r1, [r4, #0x60]
	ldrh r0, [r1, #2]
	subs r0, #4
	b _0806DF72
_0806DF5C:
	ldr r1, [r4, #0x60]
	ldrh r0, [r1, #2]
	adds r0, #2
	b _0806DF72
_0806DF64:
	ldr r1, [r4, #0x60]
	ldrh r0, [r1, #2]
	adds r0, #3
	b _0806DF72
_0806DF6C:
	ldr r1, [r4, #0x60]
	ldrh r0, [r1, #2]
	adds r0, #4
_0806DF72:
	strh r0, [r1, #2]
_0806DF74:
	ldr r1, [r4, #0x60]
	ldrh r0, [r1, #4]
	subs r0, #6
	strh r0, [r1, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _0806DF9C
	ldr r0, [r4, #0x60]
	movs r2, #2
	ldrsh r1, [r0, r2]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0806DFB0
_0806DF9C:
	ldr r0, _0806DFB8 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl sub_8002DE4
_0806DFB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806DFB8: .4byte 0x0201774C

