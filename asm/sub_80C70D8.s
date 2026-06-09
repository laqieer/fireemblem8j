	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set UnskipGmNodeIconDisplay, 0x080C0538 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_80C7048, 0x080C7048 + 1
	.section .text.sub_80C70D8, "ax", %progbits
@ sub_80C70D8 @ JP 0x080C70D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C70D8
	.thumb_func
sub_80C70D8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C7144 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x48]
	bl UnskipGmNodeIconDisplay
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r4, #0
	bl sub_80C7048
	ldr r2, _080C7148 @ =0x03003020
	ldrb r3, [r2, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	movs r3, #3
	orrs r0, r3
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	orrs r0, r3
	strb r0, [r2, #0x18]
	movs r0, #2
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r2, _080C714C @ =0x03005270
	ldrb r0, [r2]
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7144: .4byte 0x08AC1108
_080C7148: .4byte 0x03003020
_080C714C: .4byte 0x03005270

