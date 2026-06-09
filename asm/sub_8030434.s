	.syntax unified
	.set CallARM_PushToPrimaryOAM, 0x08002B1C + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_800219C, 0x0800219C + 1
	.section .text.sub_8030434, "ax", %progbits
@ sub_8030434 @ JP 0x08030434 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8030434
	.thumb_func
sub_8030434:
	push {r4, r5, lr}
	bl sub_800219C
	cmp r0, #0
	beq _08030478
	bl sub_8000CD8
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _08030480 @ =0x020027DC
	adds r4, r1, r0
	movs r5, #0x1f
_08030452:
	ldrh r0, [r4, #4]
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	movs r1, #0xff
	ands r0, r1
	subs r0, #0x10
	ldr r1, _08030484 @ =0x000001FF
	ands r0, r1
	movs r2, #2
	ldrsh r1, [r4, r2]
	ldr r2, _08030488 @ =0x085B8CEC
	ldr r3, _0803048C @ =0x0000101C
	bl CallARM_PushToPrimaryOAM
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _08030452
_08030478:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030480: .4byte 0x020027DC
_08030484: .4byte 0x000001FF
_08030488: .4byte 0x085B8CEC
_0803048C: .4byte 0x0000101C

