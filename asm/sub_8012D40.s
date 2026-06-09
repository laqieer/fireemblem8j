	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002330, 0x08002330 + 1
	.section .text.sub_8012D40, "ax", %progbits
@ sub_8012D40 @ JP 0x08012D40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8012D40
	.thumb_func
sub_8012D40:
	push {lr}
	ldr r0, _08012D5C @ =0x085BA36C
	bl Proc_Find
	cmp r0, #0
	beq _08012D92
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _08012D60
	cmp r0, #1
	beq _08012D7C
	b _08012D86
	.align 2, 0
_08012D5C: .4byte 0x085BA36C
_08012D60:
	ldr r2, _08012D74 @ =0x0202BCAC
	ldrh r3, [r2, #0xc]
	ldr r1, _08012D78 @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2, #0xc]
	ldrh r0, [r2, #0xe]
	ands r1, r0
	strh r1, [r2, #0xe]
	b _08012D86
	.align 2, 0
_08012D74: .4byte 0x0202BCAC
_08012D78: .4byte 0x0000FFFC
_08012D7C:
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_08012D86:
	ldr r0, _08012D98 @ =0x085BA36C
	bl Proc_EndEach
	movs r0, #4
	bl sub_8002330
_08012D92:
	pop {r0}
	bx r0
	.align 2, 0
_08012D98: .4byte 0x085BA36C

