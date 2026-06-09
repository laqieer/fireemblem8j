	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_806F234, "ax", %progbits
@ sub_806F234 @ JP 0x0806F234 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F234
	.thumb_func
sub_806F234:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #1
	bne _0806F24C
	ldr r0, _0806F248 @ =0x0860E820
	b _0806F24E
	.align 2, 0
_0806F248: .4byte 0x0860E820
_0806F24C:
	ldr r0, _0806F274 @ =0x0860EA7C
_0806F24E:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _0806F278 @ =0x0860C5E0
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0806F27C @ =0x0860BDFC
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	adds r0, r5, #0
	bl sub_8002DE4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F274: .4byte 0x0860EA7C
_0806F278: .4byte 0x0860C5E0
_0806F27C: .4byte 0x0860BDFC

