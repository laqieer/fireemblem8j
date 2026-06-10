	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_800125C, 0x0800125C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_801F0E8, "ax", %progbits
@ sub_801F0E8 @ JP 0x0801F0E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801F0E8
	.thumb_func
sub_801F0E8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801F154 @ =0x0202BCAC
	adds r1, r0, #0
	adds r1, #0x3a
	ldrb r1, [r1]
	adds r0, #0x3b
	ldrb r2, [r0]
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	ldr r0, _0801F158 @ =0x085C3378
	bl Proc_Find
	cmp r0, #0
	bne _0801F14C
	ldr r0, _0801F15C @ =0x085C33C0
	bl Proc_Find
	cmp r0, #0
	bne _0801F14C
	ldr r0, _0801F160 @ =0x085C33E0
	bl Proc_Find
	cmp r0, #0
	bne _0801F14C
	bl sub_804F610
	movs r0, #0
	bl sub_800125C
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r4, #0
	bl sub_8002DE4
_0801F14C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F154: .4byte 0x0202BCAC
_0801F158: .4byte 0x085C3378
_0801F15C: .4byte 0x085C33C0
_0801F160: .4byte 0x085C33E0

