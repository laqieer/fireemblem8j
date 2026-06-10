	.syntax unified
	.set DeleteAll6CWaitMusicRelated, 0x08002A08 + 1
	.set sub_8002570, 0x08002570 + 1
	.set sub_800260C, 0x0800260C + 1
	.section .text.sub_800E064, "ax", %progbits
@ sub_800E064 @ JP 0x0800E064 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800E064
	.thumb_func
sub_800E064:
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r1, [r3, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	movs r0, #2
	ldrsh r4, [r1, r0]
	adds r5, r4, #0
	cmp r2, #0
	beq _0800E080
	cmp r2, #1
	beq _0800E0A8
	b _0800E0B4
_0800E080:
	ldrh r0, [r3, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800E090
	movs r0, #0
	b _0800E0B6
_0800E090:
	cmp r4, #0
	bge _0800E09A
	ldr r0, _0800E0A4 @ =0x030004B0
	movs r1, #8
	ldrsh r5, [r0, r1]
_0800E09A:
	adds r0, r5, #0
	bl sub_8002570
	b _0800E0B4
	.align 2, 0
_0800E0A4: .4byte 0x030004B0
_0800E0A8:
	bl DeleteAll6CWaitMusicRelated
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl sub_800260C
_0800E0B4:
	movs r0, #2
_0800E0B6:
	pop {r4, r5}
	pop {r1}
	bx r1

