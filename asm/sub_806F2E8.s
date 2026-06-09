	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_806F2E8, "ax", %progbits
@ sub_806F2E8 @ JP 0x0806F2E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F2E8
	.thumb_func
sub_806F2E8:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne _0806F300
	ldr r0, _0806F2FC @ =0x0860E214
	b _0806F302
	.align 2, 0
_0806F2FC: .4byte 0x0860E214
_0806F300:
	ldr r0, _0806F328 @ =0x0860E580
_0806F302:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _0806F32C @ =0x0860C5E0
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0806F330 @ =0x0860B55C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	adds r0, r5, #0
	bl sub_8002DE4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F328: .4byte 0x0860E580
_0806F32C: .4byte 0x0860C5E0
_0806F330: .4byte 0x0860B55C

